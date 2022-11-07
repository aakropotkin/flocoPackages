{

  inputs.packument.url   = "https://registry.npmjs.org/pixrem?rev=55-8e0a80913fcabbbf10b2cf3dad6ee878";
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
    ident = "pixrem";
    ldir  = "info/unscoped/p/pixrem";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
