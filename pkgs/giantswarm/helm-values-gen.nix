{
  fetchFromGitHub,
  buildGoModule,
  ...
}:
buildGoModule (finalAttrs: {
  pname = "helm-values-gen";
  version = "1.0.4";

  src = fetchFromGitHub {
    owner = "giantswarm";
    repo = finalAttrs.pname;
    rev = "v${finalAttrs.version}";
    hash = "sha256-7hgeHvTKcGzgHLf67gnB8tu6hdNHwoNNroG1KFu9lPg=";
  };

  vendorHash = "sha256-yd8EHDgfK6afIJfr/y5tRplflKpvcSNKXrlzF8j29Qw=";
})
