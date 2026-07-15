This is now archived.


# [OpenShift Tips](https://openshift-tips.rezzell.com)

This site pretends to compile a list of OpenShift 4 tips, mainly one liners.

# Contact

The main author of this site is [Eduardo Minguez](https://eduardominguez.es) but
collaborations are appreciated :)

Feel free to contact me at <hello@openshift.tips> or add a new issue to the
[repo](https://github.com/openshifttips/web/issues/new)

# Howto

This site is based on:

- [Hugo](https://gohugo.io) as the static site framework.
- [Techdoc Hugo's theme](https://themes.gohugo.io/hugo-theme-techdoc/)
- [GitHub](https://github.com/russell-parks/openshift-tips-web) to host the git repository.
- [Cloudflare Pages](https://pages.cloudflare.com/) to run the builds and serve the content.
- Cloudflare-managed certificates for the site TLS endpoint.

Cloudflare Pages should deploy from `integration/latest` with:

- Build command: `hugo --gc --minify -b "$CF_PAGES_URL"`
- Build output directory: `public`
- `HUGO_VERSION=0.55.6`
- `HUGO_ENV=production`
- `HUGO_ENABLEGITINFO=true`

The production custom domain is expected to be `openshift-tips.rezzell.com`.

Also, we use [ForwardEmail.net](https://forwardemail.net/).

Everything is free (as in beer) so anyone can build the same stuff at 0 cost :)
Also, some of the tools used (such as Hugo and ForwardEmail) are open source as
well \o/

# Other

[I prefer tabs vs spaces.](https://www.reddit.com/r/javascript/comments/c8drjo/nobody_talks_about_the_real_reason_to_use_tabs/)
