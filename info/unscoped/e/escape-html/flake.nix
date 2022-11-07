{

  inputs.packument.url   = "https://registry.npmjs.org/escape-html?rev=57-2fecba2e4445c3171a82f7cd8fbf4e78";
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
    ident = "escape-html";
    ldir  = "info/unscoped/e/escape-html";
    inherit packument fetchInfo;
  } // latest';

}
