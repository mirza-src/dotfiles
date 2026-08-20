{
  fetchFromGitHub,
  buildGoModule,
  ...
}:
buildGoModule (finalAttrs: {
  pname = "architect";
  version = "8.3.0";

  src = fetchFromGitHub {
    owner = "giantswarm";
    repo = finalAttrs.pname;
    rev = "v${finalAttrs.version}";
    hash = "sha256-SOm80jVaCG6vk5mCxEEFD8APyswCzxAmXT7QJlFZprU=";
  };

  vendorHash = "sha256-2Eb655FkWOlMuCY6RPFKc5+Yzyrvg2tYWz37LSnLjC4=";

  # TODO: Some tests failing in sandboxed environment
  doCheck = false;
})
