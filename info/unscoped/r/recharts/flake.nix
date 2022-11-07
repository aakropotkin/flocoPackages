{

  inputs.packument.url   = "https://registry.npmjs.org/recharts?rev=240-ca77ec576e3cf3275e2fac334f4d8b33";
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
    ident = "recharts";
    ldir  = "info/unscoped/r/recharts";
    inherit packument fetchInfo;
  } // latest';

}
