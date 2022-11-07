{

  inputs.packument.url   = "https://registry.npmjs.org/jest-each?rev=144-e4d64bdaf2b210f368201d1de9d48e17";
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
    ident = "jest-each";
    ldir  = "info/unscoped/j/jest-each";
    inherit packument fetchInfo;
  } // latest';

}
