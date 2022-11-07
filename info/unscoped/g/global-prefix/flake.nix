{

  inputs.packument.url   = "https://registry.npmjs.org/global-prefix?rev=17-ab075883c8b1b919bee9b27bac552e17";
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
    ident = "global-prefix";
    ldir  = "info/unscoped/g/global-prefix";
    inherit packument fetchInfo;
  } // latest';

}
