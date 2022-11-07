{

  inputs.packument.url   = "https://registry.npmjs.org/jss-plugin-nested?rev=51-72ea543ad25f612cccd54c77261a1450";
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
    ident = "jss-plugin-nested";
    ldir  = "info/unscoped/j/jss-plugin-nested";
    inherit packument fetchInfo;
  } // latest';

}
