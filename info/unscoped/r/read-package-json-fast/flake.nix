{

  inputs.packument.url   = "https://registry.npmjs.org/read-package-json-fast?rev=35-922e24bf83c7ac3f86bbd2a573e0b443";
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
    ident = "read-package-json-fast";
    ldir  = "info/unscoped/r/read-package-json-fast";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
