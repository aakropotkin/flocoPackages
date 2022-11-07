{

  inputs.packument.url   = "https://registry.npmjs.org/string-width?rev=27-c93eef9da82ccd3d28748ae301ef2606";
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
    ident = "string-width";
    ldir  = "info/unscoped/s/string-width";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
