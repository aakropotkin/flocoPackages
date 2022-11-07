{

  inputs.packument.url   = "https://registry.npmjs.org/default-user-agent?rev=5-0390dbe0a655a5bcae68466ab29061cf";
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
    ident = "default-user-agent";
    ldir  = "info/unscoped/d/default-user-agent";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
