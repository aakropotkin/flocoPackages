{

  inputs.packument.url   = "https://registry.npmjs.org/rc-field-form?rev=124-15d0440f8e2ad4f7fff56962e53fb47f";
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
    ident = "rc-field-form";
    ldir  = "info/unscoped/r/rc-field-form";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
