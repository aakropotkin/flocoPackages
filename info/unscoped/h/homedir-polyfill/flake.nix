{

  inputs.packument.url   = "https://registry.npmjs.org/homedir-polyfill?rev=7-f2f5c325a0c17766eba7adb533f45e9e";
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
    ident = "homedir-polyfill";
    ldir  = "info/unscoped/h/homedir-polyfill";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
