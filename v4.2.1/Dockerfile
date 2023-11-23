FROM tootsuite/mastodon:v4.2.1

COPY ./patch.sh /opt/patch/patch.sh
COPY ./themes /opt/patch/themes

WORKDIR /opt/patch
RUN sh patch.sh 

WORKDIR /opt/mastodon
# version suffix was removed in version 4.2.0 so append after patch section
RUN sed -i "/def patch/{n;s/$/-yai/}" /opt/mastodon/lib/mastodon/version.rb \
  && sed -i "s|mastodon/mastodon|lori3f6/mastodon|" /opt/mastodon/lib/mastodon/version.rb \
  && OTP_SECRET=precompile_placeholder SECRET_KEY_BASE=precompile_placeholder rails assets:precompile \
  && yarn cache clean

