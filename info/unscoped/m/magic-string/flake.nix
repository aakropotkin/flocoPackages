{

  inputs.packument.url   = "https://registry.npmjs.org/magic-string?rev=136-f47ab2590a7716e99b816762dfb9ec4a";
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
    ident = "magic-string";
    ldir  = "info/unscoped/m/magic-string";
    inherit packument fetchInfo;
  } // latest';

}
