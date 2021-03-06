
for part in ensemble_train ensemble_validate test; do 
  output_dir="/Youtube-8M/model_predictions/${part}/distillchain_lstmcnn_dcc"
  if [ ! -d $output_dir ]; then
    CUDA_VISIBLE_DEVICES=1 python inference-pre-ensemble.py \
        --output_dir="$output_dir" \
        --model_checkpoint_path="../model/distillchain_lstmcnn_dcc/model.ckpt-79669" \
        --input_data_pattern="/Youtube-8M/data/frame/${part}/*.tfrecord" \
        --distill_data_pattern="/Youtube-8M/model_predictions/${part}/distillation/ensemble_mean_model/*.tfrecord" \
        --frame_features=True \
        --feature_names="rgb,audio" \
        --feature_sizes="1024,128" \
        --distillation_features=True \
        --distillation_as_input=True \
        --model=DistillchainLstmCnnDeepCombineChainModel \
        --deep_chain_layers=2 \
        --deep_chain_relu_cells=128 \
        --distillchain_relu_cells=256 \
        --moe_num_mixtures=4 \
        --lstm_layers=1 \
        --lstm_cells="1024,128" \
        --rnn_swap_memory=True \
        --batch_size=32 \
        --file_size=4096
  fi
done
