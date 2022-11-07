{

  inputs.packument.url   = "https://registry.npmjs.org/rust-result?rev=8-7fd31ec1cc45bb2f86fc06fdd45588a0";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "rust-result";
    ldir  = "info/unscoped/r/rust-result";
    inherit packument fetchInfo;
  } // latest';

}
