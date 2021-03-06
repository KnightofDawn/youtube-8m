#!/bin/bash
file_num_mod=$1

data_path=/Youtube-8M/model_predictions_x32/train

input_data_pattern="/Youtube-8M/data/frame/train/*.tfrecord"
prediction_data_pattern="${data_path}/distillation/ensemble_v2_matrix_model/prediction*.tfrecord"

CUDA_VISIBLE_DEVICES="" python inference-combine-tfrecords-frame.py \
	      --output_dir="/Youtube-8M/distillation_v2/frame/train" \
        --input_data_pattern="$input_data_pattern" \
        --prediction_data_pattern="$prediction_data_pattern" \
	      --file_num_mod=$file_num_mod \
	      --batch_size=128 \
	      --file_size=1024
