{

  inputs.packument.url   = "https://registry.npmjs.org/dateformat?rev=184-7d9ebd35f24870341f409151cb1ef50a";
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
    ident = "dateformat";
    ldir  = "info/unscoped/d/dateformat";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
