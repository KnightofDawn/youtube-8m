
for part in test ensemble_train ensemble_validate train_samples; do 
    CUDA_VISIBLE_DEVICES=1 python inference-pre-ensemble.py \
	      --output_dir="/Youtube-8M/model_predictions/${part}/lstmattlstm1024_moe8" \
              --model_checkpoint_path="../model/lstmattlstm1024_moe8/model.ckpt-86809" \
	      --input_data_pattern="/Youtube-8M/data/frame/${part}/*.tfrecord" \
	      --frame_features=True \
	      --feature_names="rgb,audio" \
	      --feature_sizes="1024,128" \
	      --batch_size=32 \
	      --file_size=4096
done
