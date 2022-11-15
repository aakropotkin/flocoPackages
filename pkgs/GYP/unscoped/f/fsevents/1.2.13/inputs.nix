{ pkgs
, stdenv
, CoreServices ? pkgs.darwin.apple_sdk.frameworks.CoreServices
}: {
  buildInputs = if stdenv.hostPlatform.isDarwin then [CoreServices] else [];
}
