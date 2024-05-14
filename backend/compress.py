import os
from PIL import Image

# 画像ファイルのリストを取得
files = os.listdir("image")
img_files = [f for f in files if f.endswith(".jpg")]
print(img_files)

# 画像ファイルをリサイズ
for img_file in img_files:
    img = Image.open(os.path.join("image", img_file))
    img.thumbnail((25, 25))
    img.save(os.path.join("image", "resized", img_file), quality=20)

print("✅ リサイズ完了しました")
