{

  inputs.packument.url   = "https://registry.npmjs.org/tweetnacl?rev=51-c4c363eb930affa63433c61c7a0d567e";
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
    ident = "tweetnacl";
    ldir  = "info/unscoped/t/tweetnacl";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
