{

  inputs.packument.url   = "https://registry.npmjs.org/err-code?rev=22-0ae43d4fc7587bd273e579cf0aa2fe03";
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
    ident = "err-code";
    ldir  = "info/unscoped/e/err-code";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
