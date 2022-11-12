{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/htmlescape?_rev=13-0d8897027c0a7457498701b874df05ac";
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
    ident = "htmlescape";
    ldir  = "info/unscoped/h/htmlescape";
    inherit packument fetchInfo;
  } // latest';

}
