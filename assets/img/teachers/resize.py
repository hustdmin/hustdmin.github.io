import os
from PIL import Image

# 调整图片尺寸的函数
def resize_image(image_path, target_size):
    img = Image.open(image_path).convert('RGB')
    resized_img = img.resize(target_size, Image.ANTIALIAS)
    resized_img = resized_img.convert('RGB')
    resized_img.save(image_path)

# 获取当前目录下所有的jpg图片文件
current_directory = os.getcwd()
image_files = [file for file in os.listdir(current_directory) if file.endswith(".png")]

# 设置目标尺寸
target_size = (335, 416)  # 设置为自己想要的尺寸

# 遍历图片文件并调整尺寸
for image_file in image_files:
    image_path = os.path.join(current_directory, image_file)
    print(image_path)
    resize_image(image_path, target_size)