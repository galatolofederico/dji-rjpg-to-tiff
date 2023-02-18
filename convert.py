import argparse
import os
from PIL import Image

parser = argparse.ArgumentParser()

parser.add_argument("--input-folder", type=str, default="./inputs")
parser.add_argument("--raw-folder", type=str, default="./outputs/raw")
parser.add_argument("--outout-folder", type=str, default="./outputs/tif")

args = parser.parse_args()

os.makedirs(args.outout_folder, exist_ok=True)

for file in os.listdir(args.input_folder):
    print(f"Converting file: {file}.raw")
    original_file = Image.open(os.path.join(args.input_folder, file))
    raw_data = open(os.path.join(args.raw_folder, file + ".raw"), "rb").read()
    raw_file = Image.frombytes("F", original_file.size, raw_data)
    raw_file.save(os.path.join(args.outout_folder, file + ".tif"))
