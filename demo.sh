echo "demo.sh: PATH=$PATH"
echo "demo.sh: which python -> $(which python)"
echo "demo.sh: python -c 'import sys;print(sys.executable)' ->"
python -c "import sys; print(sys.executable)"
python -c "import torch; print('torch.cuda.is_available():', torch.cuda.is_available())"

CUDA_ID=0
# SEQ_NAME=scene0608_00
# SEQ_NAME=scene0568_00
# SEQ_NAME=scene0549_00
SEQ_NAME=scene0050_00-

echo [INFO] start mask clustering
CUDA_VISIBLE_DEVICES=$CUDA_ID python main.py --config demo --debug --seq_name_list $SEQ_NAME
echo [INFO] finish mask clustering

echo [INFO] visualizing
python -m visualize.vis_scene --config demo --seq_name $SEQ_NAME
echo [INFO] Please follow the instruction of pyviz to visualize the scene