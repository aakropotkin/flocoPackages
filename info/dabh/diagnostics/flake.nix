{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@dabh%2fdiagnostics?_rev=2-fe75c7f7982d850e358d60f783ea373a";
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
    scope = "@dabh";
    ident = "@dabh/diagnostics";
    ldir  = "info/dabh/diagnostics";
    inherit packument fetchInfo;
  } // latest';

}
