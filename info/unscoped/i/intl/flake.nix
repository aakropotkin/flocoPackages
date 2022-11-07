{

  inputs.packument.url   = "https://registry.npmjs.org/intl?rev=61-e6a76df68f323bc565ff37b5ef345bfd";
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
    ident = "intl";
    ldir  = "info/unscoped/i/intl";
    inherit packument fetchInfo;
  } // latest';

}
