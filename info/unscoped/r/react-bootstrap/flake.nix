{

  inputs.packument.url   = "https://registry.npmjs.org/react-bootstrap?rev=363-62868fd7f1911ae7da9d07e061d967cc";
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
    ident = "react-bootstrap";
    ldir  = "info/unscoped/r/react-bootstrap";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
