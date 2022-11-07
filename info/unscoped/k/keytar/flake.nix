{

  inputs.packument.url   = "https://registry.npmjs.org/keytar?rev=147-24493adae53aeada4ae2b81d68767d14";
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
    ident = "keytar";
    ldir  = "info/unscoped/k/keytar";
    inherit packument fetchInfo;
  } // latest';

}
