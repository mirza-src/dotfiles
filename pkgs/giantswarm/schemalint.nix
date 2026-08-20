{
  fetchFromGitHub,
  buildGoModule,
  ...
}:
buildGoModule (finalAttrs: {
  pname = "schemalint";
  version = "2.6.3";

  src = fetchFromGitHub {
    owner = "giantswarm";
    repo = finalAttrs.pname;
    rev = "v${finalAttrs.version}";
    hash = "sha256-5J76KMGGnuD6Q+0YB3exB6SHr6k1DN1pTGZ+I7GDq9s=";
  };

  vendorHash = "sha256-Rae0TjqnJA2tJ4DgvSMcqA76osOGKGyHd8zrsmDboE8=";
})
