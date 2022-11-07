{

  inputs.packument.url   = "https://registry.npmjs.org/email-addresses?rev=29-b5c6c8a51e679927babff61ca8df2569";
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
    ident = "email-addresses";
    ldir  = "info/unscoped/e/email-addresses";
    inherit packument fetchInfo;
  } // latest';

}
