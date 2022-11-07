{

  inputs.packument.url   = "https://registry.npmjs.org/make-dir?rev=23-0667e6cb07dbb2cac67f9fecc782340e";
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
    ident = "make-dir";
    ldir  = "info/unscoped/m/make-dir";
    inherit packument fetchInfo;
  } // latest';

}
