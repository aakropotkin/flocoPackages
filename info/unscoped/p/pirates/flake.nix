{

  inputs.packument.url   = "https://registry.npmjs.org/pirates?rev=32-5a2bf133029f342a8d9146309de43ad8";
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
    ident = "pirates";
    ldir  = "info/unscoped/p/pirates";
    inherit packument fetchInfo;
  } // latest';

}
