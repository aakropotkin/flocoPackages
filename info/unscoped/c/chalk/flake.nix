{

  inputs.packument.url   = "https://registry.npmjs.org/chalk?rev=1189-e96a61ef34b131844e059f63e0f70a8f";
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
    ident = "chalk";
    ldir  = "info/unscoped/c/chalk";
    inherit packument fetchInfo;
  } // latest';

}
