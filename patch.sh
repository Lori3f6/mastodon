# ref: https://github.com/wxwmoe/mastodon
# content length limit 500 -> 2500:
sed -i "s|MAX_CHARS = 500|MAX_CHARS = 2600|" mastodon_source/app/validators/status_length_validator.rb

# Frontend character check will read the value defined in mastodon/app/serializers/rest/instance_serializer.rb
# which will read value from validators (for example status_length_validator) 
# please see the references below:
# ref1: https://github.com/mastodon/mastodon/pull/28928
# ref2: https://github.com/mastodon/mastodon/pull/30091
# So these frontend patch are not needed now.
# sed -i "s|length(fulltext) > 500|length(fulltext) > 2600|" mastodon_source/app/javascript/mastodon/features/compose/components/compose_form.jsx
# sed -i "s|CharacterCounter max={500}|CharacterCounter max={2600}|" mastodon_source/app/javascript/mastodon/features/compose/components/compose_form.jsx

# For attachment resizing, it has been removed from client side.
# Mastodon v4.2.0 has changed the media size limit to a relatively adequate limit as:
#   - pixels 2_073_600 (1920x1080px) -> 8_294_400 (3840x2160px)
#   - IMAGE_LIMIT 10 -> 16 MB
#   - VIDEO_LIMIT 40 -> 99 MB
# So it may not need a patch.
# ref: https://github.com/mastodon/mastodon/commit/9bda93374093c738f1007922b2e8df58043c718f (#23726)

# Poll options limit 4 -> 8:
# the same as the max chars:
# ref: https://github.com/mastodon/mastodon/pull/29490
# sed -i "s|options.size >= 4|options.size >= 8|" mastodon_source/app/javascript/mastodon/features/compose/components/poll_form.jsx

sed -i "s|MAX_OPTIONS      = 4|MAX_OPTIONS      = 8|" mastodon_source/app/validators/poll_validator.rb

# Apply themes
for f in themes/*.sh; do
  bash "$f" 
done


