{

  inputs.packument.url   = "https://registry.npmjs.org/xmlcreate?rev=15-b70b647669d519e07a022671bc419250";
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
    ident = "xmlcreate";
    ldir  = "info/unscoped/x/xmlcreate";
    inherit packument fetchInfo;
  } // latest';

}
