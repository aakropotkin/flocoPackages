{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/quick-format-unescaped?_rev=20-ae0968c59bc6e8a4b465cbeb22db1a08";
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
    ident = "quick-format-unescaped";
    ldir  = "info/unscoped/q/quick-format-unescaped";
    inherit packument fetchInfo;
  } // latest';

}
