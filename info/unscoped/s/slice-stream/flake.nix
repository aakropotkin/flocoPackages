{

  inputs.packument.url   = "https://registry.npmjs.org/slice-stream?rev=7-9f8d339f767b7407f7180814ff9a91c4";
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
    ident = "slice-stream";
    ldir  = "info/unscoped/s/slice-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
