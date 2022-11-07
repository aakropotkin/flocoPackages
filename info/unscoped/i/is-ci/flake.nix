{

  inputs.packument.url   = "https://registry.npmjs.org/is-ci?rev=24-2bd03e9a8c78162a501c18c8f4811586";
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
    ident = "is-ci";
    ldir  = "info/unscoped/i/is-ci";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
