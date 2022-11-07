{

  inputs.packument.url   = "https://registry.npmjs.org/npm-conf?rev=9-de3db749b1efa5103bcd5774e7c814cd";
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
    ident = "npm-conf";
    ldir  = "info/unscoped/n/npm-conf";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
