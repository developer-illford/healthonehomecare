import pathlib

root = pathlib.Path(r'c:\healthonehomecare copy')
old_assets = [
    'assets/images/logo-new.webp',
    'assets/images/logo.webp',
    'assets/images/footer-logo.webp',
]
new_asset = 'assets/images/logo-health-one-professional.svg'

count = 0
for path in root.rglob('*.html'):
    text = path.read_text(encoding='utf-8')
    new_text = text
    for old in old_assets:
        new_text = new_text.replace(f'src="{old}"', f'src="{new_asset}"')
        new_text = new_text.replace(f"src='{old}'", f"src='{new_asset}'")
    if new_text != text:
        path.write_text(new_text, encoding='utf-8')
        count += 1

print(f'updated_files={count}')
