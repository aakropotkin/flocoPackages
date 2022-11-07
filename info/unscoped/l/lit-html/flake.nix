{

  inputs.packument.url   = "https://registry.npmjs.org/lit-html?rev=127-d435f27fae67779a55d18b3291da8272";
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
    ident = "lit-html";
    ldir  = "info/unscoped/l/lit-html";
    inherit packument fetchInfo;
  } // latest';

}
