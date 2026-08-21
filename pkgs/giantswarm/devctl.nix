{
  git,
  fetchgit, # HACK: leaveDotGit appears to be work only with this fetcher
  buildGoModule,
  ...
}:
buildGoModule (finalAttrs: {
  pname = "devctl";
  version = "8.38.3";

  src = fetchgit {
    url = "https://github.com/giantswarm/${finalAttrs.pname}";
    rev = "v${finalAttrs.version}";
    sha256 = "sha256-tgJULyZUQRn80jXzowD9ilK98SjWm/AznodNldp0Hxo=";
    leaveDotGit = true; # Generate script uses git history
  };

  nativeBuildInputs = [ git ];
  preBuild = ''
    go generate ./...
  '';

  proxyVendor = true;
  vendorHash = "sha256-KhxvYhMhhnqIrxp5euwqEac21q2b1AO4TsmU/yFAkNw=";
})
