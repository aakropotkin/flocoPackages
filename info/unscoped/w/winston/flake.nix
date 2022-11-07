{

  inputs.packument.url   = "https://registry.npmjs.org/winston?rev=746-ad869df9470e35c0d932f587cbd540d2";
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
    ident = "winston";
    ldir  = "info/unscoped/w/winston";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
