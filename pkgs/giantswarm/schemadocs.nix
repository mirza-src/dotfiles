{
  fetchFromGitHub,
  buildGoModule,
  ...
}:
buildGoModule (finalAttrs: {
  pname = "schemadocs";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "giantswarm";
    repo = finalAttrs.pname;
    rev = "v${finalAttrs.version}";
    hash = "sha256-lgFD4q+SX0qnoqoS9y4BgwS9PhZz7ApRxI37XWaeY0g=";
  };

  vendorHash = "sha256-JuMzJN6WluM4QTS4bSukcw9GotRWP6XFBPNMEfvYdxM=";

  # TODO: Some tests failing in sandboxed environment
  doCheck = false;
})
