{

  inputs.packument.url   = "https://registry.npmjs.org/loupe?rev=31-c56767e6a7232ca98cc2aaad74a099a2";
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
    ident = "loupe";
    ldir  = "info/unscoped/l/loupe";
    inherit packument fetchInfo;
  } // latest';

}
