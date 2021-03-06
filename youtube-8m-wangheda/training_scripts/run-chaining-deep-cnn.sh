CUDA_VISIBLE_DEVICES=0 python train.py \
        --train_dir="../model/deep_cnn_deep_combine_chain/" \
        --train_data_pattern="/Youtube-8M/data/frame/train/train*" \
        --frame_features=True \
        --feature_names="rgb,audio" \
        --feature_sizes="1024,128" \
        --model=DeepCnnDeepCombineChainModel \
        --deep_chain_layers=2 \
        --deep_chain_relu_cells=256 \
	--deep_cnn_base_size=128 \
        --label_loss=MultiTaskCrossEntropyLoss \
        --multitask=True \
        --support_type="label,label" \
        --support_loss_percent=0.1 \
        --moe_num_mixtures=4 \
        --batch_size=128 \
	--dropout=True \
	--keep_prob=1.0 \
        --num_readers=4 \
	--num_epochs=2 \
        --keep_checkpoint_every_n_hours=0.5 \
        --base_learning_rate=0.001

