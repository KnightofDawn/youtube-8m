python train.py \
	--train_dir="../model/dbof_model/" \
	--train_data_pattern="/Youtube-8M/data/frame/train/*.tfrecord" \
	--frame_features=True \
	--feature_names="rgb,audio" \
	--feature_sizes="1024,128" \
	--model=DbofModel \
	--batch_size=128 \
	--num_readers=4 \
	--num_epochs=5 \
  --keep_checkpoint_every_n_hours=0.25 \
	--base_learning_rate=0.001
