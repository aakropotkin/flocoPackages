{

  inputs.packument.url   = "https://registry.npmjs.org/heavy?rev=70-8ed0c1c2c5cc4558907f51fb7f87f336";
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
    ident = "heavy";
    ldir  = "info/unscoped/h/heavy";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
