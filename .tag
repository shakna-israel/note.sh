tag() {
  echo "$2" >> "$note_dir"/"$1".tags
}

untag() {
  sed -i "/$2/d" "$note_dir"/"$1".tags
}
