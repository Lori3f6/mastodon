FROM tootsuite/mastodon:v4.2.5
ENV MASTODON_VERSION_METADATA yai

COPY ./patch.sh /opt/patch/patch.sh
COPY ./themes /opt/patch/themes

WORKDIR /opt/patch
RUN sh patch.sh 

WORKDIR /opt/mastodon
# version suffix was removed in version 4.2.0, use ENV to add build meta instead
RUN sed -i "s|mastodon/mastodon|lori3f6/mastodon|" /opt/mastodon/lib/mastodon/version.rb \
  && OTP_SECRET=precompile_placeholder SECRET_KEY_BASE=precompile_placeholder rails assets:precompile \
  && yarn cache clean

