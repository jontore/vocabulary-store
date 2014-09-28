json.array!(@vocabs) do |vocab|
  json.extract! vocab, :id, :user_id, :reference_lang, :learning_lang
  json.url vocab_url(vocab, format: :json)
end
