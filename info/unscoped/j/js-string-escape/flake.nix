{

  inputs.packument.url   = "https://registry.npmjs.org/js-string-escape?rev=24-bf6f81a8db9a81ed1e4491b3d551e9a1";
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
    ident = "js-string-escape";
    ldir  = "info/unscoped/j/js-string-escape";
    inherit packument fetchInfo;
  } // latest';

}
